Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C890C678D5
	for <intel-xe@archiver.kernel.org>; Tue,  7 Mar 2023 19:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39A410E285;
	Tue,  7 Mar 2023 19:47:15 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CDB10E53D
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Mar 2023 19:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678218434; x=1709754434;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1A2BjkXU6jTSIZv9U25spG8KyPFsTCIsUo2D+cUGs7g=;
 b=CKbk8CSbQgtZfpY2tlWZ81UtlMxpWbelM+pp5JyC9WfNiA28UpzKU6m+
 xZE0ehS0TkfYmGJo67QzuJPZlkPpJR/UqDR9CeqzDKU2KJdFbgsu9v82b
 mu98aH1w+J0OK05ASNX0ZYzhDGyeIow/q88CQal+v/rM09u7b+lcpk+0A
 sKlv+S7pMm441SROwQDwCWPkQQQXl/gz2P4oU4zFDTOKznCdUk8CM+G16
 6jXg7ZcxmdU7NejsHsAyj91eLT1Yf/hNeptZQfNYKVh66FmOE0qUYbDDg
 BNkF6vqGAfLH2z5sevf04oFLFYXf019bLnYZByibZEWPyKiv5bhr/PRn4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315614162"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="315614162"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 11:47:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="709169143"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; d="scan'208";a="709169143"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 07 Mar 2023 11:47:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 11:47:12 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 11:47:12 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 11:47:12 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 11:47:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0hOtYc5AspGdjoKvdhsd/j+/pRIeDRqP1qQyVjUhuTAs3Lzy7wwRdyUygqNzDb91QEmiTwVlbfuxJR4AFL/JUNJsKoMajxhZ0hhyl+oGpmcTWAlI5LfqoSnpoKzSKRJuRkLQM12Bi/XUm8Ok2BHvCpMCGB7NwQ2IjWe524Gwz/v5cGVMcWNMzBfckQ742dNpx3+/9pF5SJsnGMS0u1USO1EwtpPCyiTeZCdayshB/Q4gch1A6O4x594uIgBu62EZ16vIY3vA9qKMvf8JXfA4jqOcOd7ZZPJR4aWzidgQPiy6QgJ5+x/9dpDIa7q9aUgU580DF6y7Zj8Wb6f4+MxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJ235BS+tZ59fqr3cuQtYEp15IV4Sf7Mx33TPjPiix0=;
 b=PYAYTgU6mNKoNXZD0Qq60eppFJk8oeYWW/ETKEZwbMhPOsuvomt/q58XYGUv9kNPiRagUrFWy78WpVZvnGqSDGRoOsc9VSZkBCj0bhlsHkTAE/e6U6l8vjeTr+L+0KaxiDaGnIMBELfYggDlPSR9BTttVFR2gyO7KbcySpq0O6tiQv6RCTKuRUHKBjaIHoLsEUoHtI/DYXQRFYlNWXFG/RpvOy/mRuxj1YMFkF4Xgk9ovpZLD0YhTSA9ZR2QocWHSXMo02Ql67+tngG6ISvdxSQa9bNHeWLwyF30oQaEiih/lDw1Itd8rCr0vpY9TD2Sn8z8xKpldgjAHBzMhxwg7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 19:47:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 19:47:10 +0000
Date: Tue, 7 Mar 2023 11:47:08 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Message-ID: <20230307194708.ndgzjegrhboizqux@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230303105222.3550161-1-jani.nikula@intel.com>
 <167820816145.31453.2277204944037904414@emeril.freedesktop.org>
 <20230307193847.ehgdrex7tjrsgfnq@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230307193847.ehgdrex7tjrsgfnq@ldmartin-desk2.lan>
X-ClientProxiedBy: BY5PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 96d69911-b8cf-4a7c-c0c0-08db1f44bdbc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tpfkBtU9Tsp+e2h+ydxWB8tOBxn4t51q/KLxax/QAo/AuRMDlS0hWilla/Nw4OG01B5I7zXWfSj4BSjZbmDzJUZ7ywS/PRffm5RWa5VkwjuNP1aLYs6OG1UIRbtiZlY3cjyz3drjPYIKdGYjZfd0+r+sLS2/VHqYEyR8G/ESIdQ+DN2tFRkpUE9bWucaCDbMdh6aWSqH/PiuUttFaggew5tZE5QYqc0MTlCgRXwSFGrEykciJGiElu7EhlY20fQnt88ONf8qOd9fE+kYuJYPPyyqaDvQnz0QuAd4yZ09N5HzZYKDOsZXcaJSP8lr2DZxvU8AndfLwcy/L7K95kn5cIJn/oZYx9UEdSQ81YWcm/S1XcfnseZuZXQZyh5JHYVYiXjDv9JHsv8c3yxtDERsSKTf/TS3RKzDb74MnHLQA+hq6jbZMHvwNwyqiN6KZ614+834u+Exos+dHfpeY54QE4H0PjsEcY36s166YqrpKBo/izDQy72wsKc+hLFRakLD3BQA/1rS0CsdHfYovmlYXothtb6uN2hGAfS2zvsaH+sej9zuhQSEifGdoRaeE86WPgD7+Q7hFO4Z3OJYHJ9iqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199018)(83380400001)(3716004)(66556008)(5660300002)(186003)(9686003)(66946007)(6916009)(66476007)(41300700001)(26005)(2906002)(82960400001)(36756003)(107886003)(8936002)(1076003)(38100700002)(966005)(6486002)(4326008)(478600001)(6506007)(6512007)(86362001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NY9Dgl6ugxrHFXX2DesLssclXXvDDSNK2ZGcFVTjmlu2MD9JgdaXb0OxCSU2?=
 =?us-ascii?Q?9NZa/ilBzLXVsZJ7snDxDhBStJPSdWpJERQX5S+ZHBXo0NqD21atI4RTT7Nw?=
 =?us-ascii?Q?pULZQXhe5vABIEIWDoQpXRu3kGGimGlecdFli93KEltCifqUnrsnF0x6FeA7?=
 =?us-ascii?Q?bz3SaDiyf3pxprKneqOi6BiQpH+dExVaOrujSSyVVUwKwPCNhQmnvbQ1/mTO?=
 =?us-ascii?Q?dcUOZakIbhrTINy3k1pTzUiexlf7hdAtF1/9G598PDZdHKBSnn6bTM7z9nFq?=
 =?us-ascii?Q?HMBheC5Lnf/ZHdeysFfnYlYt3R3Y1vNpERD6e69nKcNlXcLJPvmeO9XchMHV?=
 =?us-ascii?Q?2FLCRnrcb9cBeG+q4Vr4AHo77smZz65Zhf9p6Fl+IELz3C8LL8npbQs1fDdq?=
 =?us-ascii?Q?nFg1YpM+73GZ57NgzqTkjqiurVdLK0R+dzSEMkSY1QDuQ+dcYAbqAD8i8Q6t?=
 =?us-ascii?Q?WqHs9AFLff3F453UMpB/oTnqVqVC6CA4uMPiA52tdeIh3qoUIFrKo7xngasv?=
 =?us-ascii?Q?FUoDgBHqrFvKFHSD9Kl0nLmDa1189DIoaoNipLRs5IKnOiLgUrURjNHKcJFO?=
 =?us-ascii?Q?LShHEboFHhladBL87FB6EbsBGeEb0Ic241NX89CA5jBQ7kiXM0a2PK/mi2Mq?=
 =?us-ascii?Q?q9YchLT4p4H13j72H9LARFPSLgLQJET/tZIqopD3e+JmFcmXM8YEmpNPkoEJ?=
 =?us-ascii?Q?qioFBe0IWIiJzzj73AtJnEtoHTbmFt2XPPRc1gHDiwKphP6DWo4NFCsp9soI?=
 =?us-ascii?Q?hJkiRvt4iLjXR8l1neTp2lV3TkgI+dp7Yd+96csk+GoPGsguYT9V3LgdPZNy?=
 =?us-ascii?Q?wmCjurc4+5tvrMjbr+N/7SXvx5AyDuVVOJ1ZP1vCalZ3PqD9t26W0M67ohw9?=
 =?us-ascii?Q?ztLbUP8GjjMAj06F9INEVpeK6fU16qYpeM0WrjCigTuzpZJiGDCDSZEBx58h?=
 =?us-ascii?Q?V76sb76xEmD8bleEeIafOlNmE87DbkB7Q9mq3KtupsI7/KHb54dZFHx6PSau?=
 =?us-ascii?Q?P7tTjXRVG0XIV+A3NDqtLPY+50KVU2mSN3Z+nHjb/CHFfiS5hWVyeITuSb85?=
 =?us-ascii?Q?9QFLf0200ZNvS96o1hCB1zNAPOGiGnw9zbq61xk/f8JTwIwqvrHBwU+iA3Tk?=
 =?us-ascii?Q?3kegy2MvSJvsGl7/ABYJFl4U81qyMd5gVt+gOZBcY6boVLGiTwh4KTJCySFb?=
 =?us-ascii?Q?otWLQ01nM8zBPettq153VPBCxmeEg+Q1N/MrOcjoHGy10xaThcQl6pgOGhMy?=
 =?us-ascii?Q?x3mY6AqOLB0/2vFOrSXxkiFoCrJUe5tVXfz8jUz74E/s2oPZoaXad4iP3oit?=
 =?us-ascii?Q?e0kAHNpyo3/ryEemfWP2NB9WpnCvAZQPSvKsd107kLLVm2B+HHPenTyGmMvY?=
 =?us-ascii?Q?taEOnJPIJWA0uKPFflYzvwp0vTouzfekiSk5kA8u0GOpnn0ttzTxaG7i3Be5?=
 =?us-ascii?Q?k37FXc8DN7W8Bh2k3tlXgY/G0BJd/wOnV8NB9DEJQfnbmK5YWe9NoMplGL3Y?=
 =?us-ascii?Q?33E07W1Z/YJ6Z5cWOcpgFv+2veEn7UvfiWVu8BAa/53x8QMdD4vO2yjkT4ky?=
 =?us-ascii?Q?BcgL5eba8RVuh9tb+O4+yl6kwpdehB5Q7C0mxqGrBDhMkwvroXxxWzQ5DZEj?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d69911-b8cf-4a7c-c0c0-08db1f44bdbc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 19:47:10.6589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwB07noz6wSCN5lxicdTJIaM6KFSY0LkPRhHQMfjL6V0w0cAgM/PiizMwshnKPzSfdNGmYjWJp264WT0JfsVQUG9ZXRVZ4vm0OHqL6Fz16s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
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
Cc: Jani Nikula <jani.nikula@intel.com>, michal.czaplinski@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 11:38:47AM -0800, Lucas De Marchi wrote:
>On Tue, Mar 07, 2023 at 04:56:01PM -0000, Patchwork wrote:
>>=3D=3D Series Details =3D=3D
>>
>>Series: drm/xe: clean up i915 includes both sides (rev2)
>>URL   : https://patchwork.freedesktop.org/series/114573/
>>State : failure
>>
>>=3D=3D Summary =3D=3D
>>
>>+ trap cleanup EXIT
>>+ cd /kernel
>>+ git clone https://gitlab.freedesktop.org/drm/xe/ci.git .ci
>>Cloning into '.ci'...
>>++ date +%s
>>+ echo -e '\e[0Ksection_start:1678207965:build_x86_64[collapsed=3Dtrue]\r=
\e[0KBuild x86-64'
>>+ mkdir -p build64
>>=1B[0Ksection_start:1678207965:build_x86_64[collapsed=3Dtrue]
>>=1B[0KBuild x86-64
>>+ cat .ci/kernel/kconfig
>>+ make O=3Dbuild64 olddefconfig
>>make[1]: Entering directory '/kernel/build64'
>> GEN     Makefile
>> HOSTCC  scripts/basic/fixdep
>> HOSTCC  scripts/kconfig/conf.o
>> HOSTCC  scripts/kconfig/confdata.o
>> HOSTCC  scripts/kconfig/expr.o
>> LEX     scripts/kconfig/lexer.lex.c
>> YACC    scripts/kconfig/parser.tab.[ch]
>> HOSTCC  scripts/kconfig/lexer.lex.o
>> HOSTCC  scripts/kconfig/menu.o
>> HOSTCC  scripts/kconfig/parser.tab.o
>> HOSTCC  scripts/kconfig/preprocess.o
>> HOSTCC  scripts/kconfig/symbol.o
>> HOSTCC  scripts/kconfig/util.o
>> HOSTLD  scripts/kconfig/conf
>>#
>># configuration written to .config
>>#
>>make[1]: Leaving directory '/kernel/build64'
>>++ nproc
>>+ make O=3Dbuild64 -j48
>>make[1]: Entering directory '/kernel/build64'
>
>
>
>...
>
>
>> CC [M]  drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_dccg.o
>> CC [M]  drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.o
>> C
>
>
>truncated log without the first error

and it still passes for me. This is what I regularly test with:

b4 shazam -l 20230303105222.3550161-1-jani.nikula@intel.com
make -j$(nproc) O=3Dbuild64 \
	./scripts/config --file build64/.config --disable  CONFIG_DRM_XE_DISPLAY &=
& \
	make -j$(nproc) modules_prepare && make -j$(nproc) M=3Ddrivers/gpu/drm/xe =
W=3D1; \
	./scripts/config --file build64/.config --enable  CONFIG_DRM_XE_DISPLAY

Lucas De Marchi

>
>Lucas De Marchi
