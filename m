Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE36C6FD1E
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 19:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E96E310E473;
	Tue,  7 Mar 2023 19:38:56 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181E010E473
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 19:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678217934; x=1709753934;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1SUKJvaTuKHQQhZLUqYe9YavwW//NDdJQJneWbC3vtU=;
 b=g3a3kNyxPhha686GQVM0IvDShhdY/KQ75gMCKCaDstdrlUQ+E2M2hDTj
 5Shg8BtJKF3BIS6/Ps4Qs9tYCRStzfYxVBCHexkC+NbzPv/elFeQ8gyw0
 gsNsNvPGL+ZezA/Opgmqgn3IySiDY3ZiZWTRc8hDVyPp7sZTDX8AvaWFn
 oKvMSLkGZU65q9exsx6CCJc2jm+aRgXwHmwXAEmlUDQ8LX/Q5d+wPBRYs
 71phKVd/KNml681Cp+pcdbPKDDrIuUuY6i5m7XCpjtxxsHoSlLk7F8n2x
 Ep48eBfBhj3cZ69CBe6LEmyJjPPA3J+6yMB5iu5W2vdpbCheDFlAejr9h Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="316353609"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="316353609"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 11:38:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="740831622"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="740831622"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 07 Mar 2023 11:38:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 11:38:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 11:38:53 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 11:38:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SybKPpjpBBwGVVvgxlD4qHqJ8LfnX18bdCsDAGBERRBfAYba5LHvSXQV1CNHZksIyCD5Brh559MGGR55B+vTXSukDhFCXQYLATmzRNwkJJt+c3SiI5Sw/z7jfyW1za5uaXHWy5DeX8jRGfxIl/mSJoNayyXT3KKIcl3a++7E1Ek88IDM7Rno4PvKp0brS6LvDy1V0nrh1R7scZRitdgET05Z1yaHhZVHW2zdX+Jve2mE+WOZ6BKe6XX2tzHXEI6jj1WWFB4sf6BBlBsvLviv9t0EMreGjBufXU1KEQtPpixv7eAdRnawAEZp9yBb0gQxbKrpSAhjzbmYzZWe23QDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N3d983N7Q6zArYzHUUP1GJWlDU/cXNjPcsunvQ2a0Ko=;
 b=FL7ZCwLFOfmeykWIFn2DiZJ25fZyMWe3gtyUIqi4RwXQiQ9+N0UfogFOTLmsyugGX6IHnNeY3RCdJm0jdb4cstsvpwFS8xLHvBtPMQqZi5LN7pZJ8iSobPnS7DiJMLwrHbDHWNnybOfDsUyCl2FfB78FpuZmpA3trgGpNhLkSAThDSps+Y2kLb37wEPJ+r+EZLuqXrGDyac28J8Qge9LlJL3A/mxR+HIMDlmMGzeng9ZWfaxZfVwvGZb3Woa8Z/q9diZ2KeAhNhhupoGwmj6bVG/VkyP51zhsZMdS96xH9tWuD5w7ScfWDE2Lo4QOuu5MBJt2skNSOvhH/yN1Gj67A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6737.namprd11.prod.outlook.com (2603:10b6:303:20d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 19:38:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 19:38:50 +0000
Date: Tue, 7 Mar 2023 11:38:47 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230307193847.ehgdrex7tjrsgfnq@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230303105222.3550161-1-jani.nikula@intel.com>
 <167820816145.31453.2277204944037904414@emeril.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <167820816145.31453.2277204944037904414@emeril.freedesktop.org>
X-ClientProxiedBy: MW4PR03CA0081.namprd03.prod.outlook.com
 (2603:10b6:303:b6::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: a205b2a2-a94e-4faa-3fee-08db1f43938a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AmTI4zlVKs6KdAG+jRkQa8lYJ/W1N7IrOBAX65bUfcS7ukTdgwcpRs8jMXgvWIfZb2pH1yvf2McU6MCY1wECd7cYoQu1BdENd8wr+7LtucQu87h+Jl+WUALE/AUbPPkku3H4HGYBcdXAXwiOZOxsL9RJxIMrKbqQhTRiua2I+xrA5VCJnBGPZmwFxmsfbg+QiZW8x5Abds7fDhbutoiutRB/3eGZ8b+TD5y09QEf1BUJS/l0/Eh+5s91uDuMq1VTo781vQ6grHmgj5be0tLVamQ/pFUivgNTRE8KKzfj7fXgr56p+zVrCShlA9aB7lCV/zXgt6DMGoglHfQ/sIDlZM+qPUFvAwVI2czXbLFSObQZEHWNTpz5u4XtgPBjDNX2qqgrh82fR14CEbPCXrLUhHsUSzmtZaKg61bRblEXlNl8IIFBEuMwkjQFzxWvSLTjUe8DHyWfbRnMZN6+JlK4pebycF5lkuvMcL5hZcFIsUfyDnoNuT92p3fXvpgRE+ZAdGFNT5C/hjTRUfpVHEI3EVQZtSC43mc5ASKoIl9me9NNxvK49PyrLpH3OJyy1qosw5iY1Qae0O9BVJq5ma9kMdykZ79k09nR+lnAIEWpcmw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(316002)(83380400001)(86362001)(6486002)(2906002)(966005)(9686003)(186003)(26005)(5660300002)(478600001)(66556008)(66476007)(41300700001)(4326008)(66946007)(6506007)(1076003)(6512007)(107886003)(6666004)(8936002)(6916009)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9mL8dhMg8QUmOj5743rtWslIMLoVLbDWio/2D75Pebmaq/BOkDfO+wqy4nRn?=
 =?us-ascii?Q?ueuq0dE/HsvuR6kBoQhUKFHX4+06NJgUniRjFqN5UcJTEfEceM9vxNZpOt3B?=
 =?us-ascii?Q?oiIR69HB+5j0o8Puy7dy6lSMY20m2h4H8qGbwK4AAQPkDAQa0DzmTvhGMcde?=
 =?us-ascii?Q?bIlk7TkOztzDxM1PBnGehbyftFjwPsH3XeZzdGlddX+pxwulT5O8n5hQCAal?=
 =?us-ascii?Q?H/TJ9TsFUu+P+hcg5WXNQWN1j7JoKy7lpDbO341rvNVakTRcUJKEdZdYzf0C?=
 =?us-ascii?Q?G3Asdt5xUGOMZWh87zwpp+ODek9ZolHQyko3BvRdB3s7UEtBiUj1gL6pqyQh?=
 =?us-ascii?Q?RAo3qEA1WMe+cVN8eyABGQRMkZuSwbNmX8Y6gwZJWENa/t4fyYkOBIOKxd8F?=
 =?us-ascii?Q?OggxAg8W/uPgift2+3GEvc5ab/FqhGr7FRIDEnTVJdfsuxmxJStEnLHGE4de?=
 =?us-ascii?Q?JjpCbJVxzppA4jT3iF/WafCB2oESs6FeFExSMWVIpuc8pei9P49/k3Kf+LlU?=
 =?us-ascii?Q?fVHoOr6XBuMIiVSPFt320M0Wbq8ywqEqJuM7x1hHzPGFUbHEw3JVJP+DgHrQ?=
 =?us-ascii?Q?WNAc/cSw6gDY30UMlvW18H0c/7WpYf3D1rmcUAmkMZZ6fc2OcEgQTGOKbgIN?=
 =?us-ascii?Q?nO8AxhXOC1xoHl3yqiBjW0Knyq8FzMFPGIVhRf/44AzOGRPTcTU/EvH/ZrZl?=
 =?us-ascii?Q?GsYeeuOh0TIhS9GBzt8RJ7Xs0qasRuEkejJGR1PjPnoFHoCTwpWipue3rDbP?=
 =?us-ascii?Q?d6gVeWsu8gEMdQu1iBzAIeZhXFth4lv4AFXCEk+VA2SArIakJ8SoSxaOq0pM?=
 =?us-ascii?Q?VCfxEOTCRdi8yihyR+MqFZMbziRng4oaommCLCraCatHe1Q7+4++7GPmDCs0?=
 =?us-ascii?Q?SDWbGYg4CvIBOoCJabw1iaUKNWkKlV17fHXwl+y5iWeUe3jL3Ys45McQhvFh?=
 =?us-ascii?Q?UM5xueBfPqmYSrhGOPoYlMGXvh9Jh4CVUB6Vw0/nuW/yXv3xginKJvTRHqWc?=
 =?us-ascii?Q?CGvSLoZi/ZCvx1q+DPmyEFcLZp4a6ION01BqJU32YjLAW3EQ/qzRgi+w1v19?=
 =?us-ascii?Q?xBEXUknzaNjMHafaWQaQsXS3gpHQJ9OiEhYQ2EKpqQbUbFHJxhKJ1CLNvbpK?=
 =?us-ascii?Q?oTRqcCldnC9F1OlC9zK1hj5Qa9bg2saftT4oUQdhan3BsvMhz3dvtvCA/UKj?=
 =?us-ascii?Q?do836Kz6cme8yvhH+8srl4ooxP+vRXJHt4eRvMXh2VlSEwlLjKqNDBfi5cnc?=
 =?us-ascii?Q?VeM970PzyvSLOrtzUzc+UYDQEzXqyAIIo4S9/tSrmmOuxHn1P4xCR79/8G+R?=
 =?us-ascii?Q?KB9lndt0lAhUykGr1JsKxCs+BZvS8znN4qrLTC24Zr1Os8y+k5TnOBErmza2?=
 =?us-ascii?Q?ReKSf0gua41XDR1pbLK+z8EiqLcIeXFXABc9jxaN49TRUytDi68isOBRdxE0?=
 =?us-ascii?Q?kIQDeI7hSRxLhz73Lf70eeHqsVplTAUeoQfiOlU8gMyLj+1KzQUoXYejycbf?=
 =?us-ascii?Q?KyagPRR+0koS/v0/Ow+mC4mzMdJJkQqx8IjRcmt2VVtcLz6rOp7TMnj/Z7M5?=
 =?us-ascii?Q?QVnynrJOfhYeojKo8WctMrDDAI4cG6G0JyNhT1NMPCncL2a15nOf2aIovQl3?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a205b2a2-a94e-4faa-3fee-08db1f43938a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 19:38:50.3200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQpw+bb+G8AuYUisUvqUKnC6SraNPqYRi+33oqDkkmSkNIlWp+LaT754M6a5J/OeoZKMOdl2JqTnN8KkYkFBqmDNVep+06S5dPfWfqEZ3wE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6737
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EBuild=3A_failure_for_drm/xe?=
 =?utf-8?q?=3A_clean_up_i915_includes_both_sides_=28rev2=29?=
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 04:56:01PM -0000, Patchwork wrote:
>=3D=3D Series Details =3D=3D
>
>Series: drm/xe: clean up i915 includes both sides (rev2)
>URL   : https://patchwork.freedesktop.org/series/114573/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>+ trap cleanup EXIT
>+ cd /kernel
>+ git clone https://gitlab.freedesktop.org/drm/xe/ci.git .ci
>Cloning into '.ci'...
>++ date +%s
>+ echo -e '\e[0Ksection_start:1678207965:build_x86_64[collapsed=3Dtrue]\r\=
e[0KBuild x86-64'
>+ mkdir -p build64
>=1B[0Ksection_start:1678207965:build_x86_64[collapsed=3Dtrue]
>=1B[0KBuild x86-64
>+ cat .ci/kernel/kconfig
>+ make O=3Dbuild64 olddefconfig
>make[1]: Entering directory '/kernel/build64'
>  GEN     Makefile
>  HOSTCC  scripts/basic/fixdep
>  HOSTCC  scripts/kconfig/conf.o
>  HOSTCC  scripts/kconfig/confdata.o
>  HOSTCC  scripts/kconfig/expr.o
>  LEX     scripts/kconfig/lexer.lex.c
>  YACC    scripts/kconfig/parser.tab.[ch]
>  HOSTCC  scripts/kconfig/lexer.lex.o
>  HOSTCC  scripts/kconfig/menu.o
>  HOSTCC  scripts/kconfig/parser.tab.o
>  HOSTCC  scripts/kconfig/preprocess.o
>  HOSTCC  scripts/kconfig/symbol.o
>  HOSTCC  scripts/kconfig/util.o
>  HOSTLD  scripts/kconfig/conf
>#
># configuration written to .config
>#
>make[1]: Leaving directory '/kernel/build64'
>++ nproc
>+ make O=3Dbuild64 -j48
>make[1]: Entering directory '/kernel/build64'



...


>  CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dccg.o
>  CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.o
>  C


truncated log without the first error

Lucas De Marchi
