Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B3FC74A5B
	for <intel-xe@archiver.kernel.org>; Fri, 17 Mar 2023 15:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A6610E3CA;
	Fri, 17 Mar 2023 15:44:14 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830D710E3CA
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Mar 2023 15:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679067852; x=1710603852;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YmVTa/mL/W/bjWvdvGShsDS0+4qG6G9ARpiOSyOqHWM=;
 b=RLRDAmZbBw4+MgX9zOx6uallMTLdZMuH/ix7q2ftiMxHYzV/y8sOi91W
 v3HAQ+N/9vg9GBS/8mCxAr3T405z/Q44b5KiNlzosdlX+0n+mPNy0/Osy
 X7l0FWyKEcY7npoCweW0LT325WhnJ7RzsuheH7T3O42QLrr4V24u9gHhG
 W/z+ZseEu0so6PIcFYQYM2FJkNc1GXx/M3BrwlnKRInVh4VoIDJa5sS29
 0q5mRZBbOvvpScfFelW6IbYrbzJmOREBSByZzfP14waiHQL387lJQ1Oke
 JqE6bPc48Hedhc8HEoGnvE4iyCtjpQedeM5jzCZqA7e/wQoef/XZ6wtJ2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="400866484"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="400866484"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2023 08:44:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="769395775"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; d="scan'208";a="769395775"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Mar 2023 08:44:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 08:44:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 17 Mar 2023 08:44:10 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 17 Mar 2023 08:44:10 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 17 Mar 2023 08:44:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFne2eoesHsX5yK5mNcP1b2QKFq2yehut0dAVd+jm7qMtUW6oq6IflCAFZ0PRgwRKbSFsiz6y3hvSSwO/NUeehdb377AwpoMeE545Zuv/MzI+jJRpQtdWRHgZhw55zx6Qc+l7HjreadwiEs8dRUHWl9x8zYuZsQVZjDw/moXHFRVb+i5y7lpjv52y44EbA6b0VDlNDgSEzUfT9NyNqAQDKWE1XuVv7YgknfBEkrImj2HSW6m2Z3qiVZeGr7PJe4OWXMcP5RG/7u+XpWTiBqusrgb2KHR3qKUXB/9plOMamT7CnjRQo6bouhJJEo0BLQlx9aJN+5VRfMygN7Ldyovjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OjCJqJ6Y6g3HHIAiFbK6f56TzW8dMutLL5elKeEcnk=;
 b=PxSrsysy9ezMIKgGb/seBDcmHExkaeiy496UZfdKJwIWy9wR4jcYGRoCj7PSROmsjekOAY/Zhz6qeVQmz3Q0prBAp43DlP817SrihIxE0FrOqm4VgCmzQXUO6tfWowCSrrNPptDxPZjdvNGBV3s4OTLuoz+t0vCewyQ75miYqjZDkWPXX4+BRYhRlrrsdDR6lCaL4DTZOx2tziJI8kWtwOo3VyYr/wDyYsFPkpoglQ3qeL/fWZRaBi3tAK9hue6zVU0EMCqRk/gMeAbI7f+lJufmWIUQf8haGlIysktCQl55f4Ku3oHc6Xg5tIxPmkrbcLPXYfNyo5p2DvDJv1yY4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7991.namprd11.prod.outlook.com (2603:10b6:510:25a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Fri, 17 Mar
 2023 15:44:09 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 15:44:08 +0000
Date: Fri, 17 Mar 2023 08:44:03 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <20230317154403.mnbk6dkuaomiqqoq@ldmartin-desk2.jf.intel.com>
X-Patchwork-Hint: comment
References: <20230316210341.3547058-1-lucas.demarchi@intel.com>
 <20230316210341.3547058-3-lucas.demarchi@intel.com>
 <20230317160740.0fb124de@maurocar-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230317160740.0fb124de@maurocar-mobl2>
X-ClientProxiedBy: BYAPR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7991:EE_
X-MS-Office365-Filtering-Correlation-Id: 953a43aa-9b6b-4b20-a895-08db26fe7266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xE8LhzeEwfwbAq2HcFlTXJt1JPWoIKlU7r+5M0SgLaYoWwH15h1w+gtvajAwqiUfqRq73bqmTd/d9CoPkfUFE2K/tLCAnHyxzErxNBwQRUiJ8bu1Liqr5s3iI/CvAisY4qPwpFzt+N2kUBB68meZ+phDOUne5vmGGdXBhRj9iscohcKFlagnItroflnRBfpHX8sONhFZXVvsnpTt1R+SO7RHHLw8rPvl+Kz7f7M9FLWZDz9JhfaNuzd6t9TgqRhzf+hM50m25kuRj6QymOj2fIebfRJ2qbVjUsMk1i5hX7Z6EfZxKr72quxBMjzL1u4sKyEvWG7D9YTrZrSEGU+JFTaKdVZKLKQM1UF5XPzLKZJjwdjGMZJiAmeeT0Cuj8I6vpFyzjgMiyw3ILiuNq5rBya+jaEXoE9EQic0QNBvTvoYtGaQXJ3OSq6NdSqwV4jPNey9+DNmuZqTh/pD2CLvMP/byM6ItEtg+ipVc+MeAbJS99FZc78McWuLC6+Tc+iRP6z5AEnZ6rnkkWQ+YCtNrzwmw1B2oV8Djr7EIpVVV+MyTwN0JlaCMFOUO/HzxQfY78q0s/jnToe/krPRqJ7FDbfV3W9Gn+HGK4sInD+RoQy/BSM5/XQWa4R7F0Q2OQXG/rymz+K4bt9tO9FooJcBtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(136003)(39860400002)(376002)(346002)(451199018)(186003)(6506007)(86362001)(6512007)(6666004)(1076003)(6486002)(26005)(316002)(478600001)(82960400001)(38100700002)(2906002)(66476007)(83380400001)(8936002)(41300700001)(66946007)(8676002)(6916009)(66556008)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bWv9ruK2nf3oBqW3xw1wu1yBa+iCmYRhHTfWuZiNMmLTfaUpZVXSNUykrdrO?=
 =?us-ascii?Q?lfnqx16UAKGnp2rACYOs2ykzziW5LLkSG9wSweYmIMt5qQi71ZRHCLfXytb7?=
 =?us-ascii?Q?Uy3u+glEQyAjEl3ywDr8STrpFi0pJT2HpxgXXATpNME1I55s5aTHZsXU28RM?=
 =?us-ascii?Q?9OdvHykuEGkaHfasrkshxxyAgaFURSPGAONUke7C7FJFJtH1041NHC9XwSFv?=
 =?us-ascii?Q?+fzUQpj0SWdWzTtWbTF7w/5qVrZ0pwIfCzUSnjVRBVMSK4kLuQqV+dipRlNe?=
 =?us-ascii?Q?7zJVklQW3Ne75UpcLnPv+HwV6yspVT1Fh3J2Sosh+l1QMP7vV/HefarNfMlk?=
 =?us-ascii?Q?JRPFizEGpqwhO++bEQRVtXG+S2Om3EFboNoDHhBM3YRJlmXw6s0WFQ0I+OX3?=
 =?us-ascii?Q?WZgezrXEDkg6vsgWKYW1kcxaHR5ZX5P5FqezlpNxp1BC3E+aae2jIqbCph0q?=
 =?us-ascii?Q?qgI/N3I33c5oWDTlK1HlkSKKsvq9IdqsmjX8A7mL7gpti+3oVNf9DGKbH0H5?=
 =?us-ascii?Q?aT/MXOLwJNbcls31eNcLLAa7caD3lAqeDyX/xWNAJ2CDWyO2vYEUbFsAB+Bs?=
 =?us-ascii?Q?PY1w2612vzUAQwiy3Fil07sbu2A6IoPWHkgBE9WtKl7rREvgn17HNZfH1Urv?=
 =?us-ascii?Q?RclwU+pArgg+7xSaUrkgcVtyb/ZuvbkS0mXgBmgZxJaEL0/rbFyjvra7ONz9?=
 =?us-ascii?Q?1T5nbinJyIz+cxF0avJIWAy1l98p6GeVORaa2xhirftKmLECtDibzgYqJNJc?=
 =?us-ascii?Q?9TpWpcUdaJn4surgkwCd2jDWm2Pk3wDX1os3Oujeo7ZvmNVS5370XrvaK6uh?=
 =?us-ascii?Q?7L6RC1ZBWBFY+3z0iA6E9b2l1l6iP2pmE4cvCw/gG2JNbp0m8xUwAol1tH5Q?=
 =?us-ascii?Q?ig/pfyizwDa99igBp7bVwUBA15qvUGTIiE4VK70OEJZc08hZxzh4BC7sOzEq?=
 =?us-ascii?Q?VTs+kvavcRtvktvpnZa6YPoWTU0+BQbyA03pmstOMLYsA0EYEB3geIvvJWMI?=
 =?us-ascii?Q?c7FJuXa8MGr2gL3pNSmZ7hUEuSXGghhsILPVsCP3kYavvWSsTx1xfjwIIE/q?=
 =?us-ascii?Q?I9wrdwoc22LDrhHRoTJPNtNrJcYsCCPYJZCEOXDR/IHcOfqbpFzoMO4Imu5W?=
 =?us-ascii?Q?TNtCByncMlHOhnLkZSgKIy0g8lsvwUYz7SUW5wZ0F57m9OztvjlwxOrYlgPI?=
 =?us-ascii?Q?yQXrpFgV7HWttADSvhzQrzxNqPjPm2MJp45yDrd0+nCvs7EbPU9J/lfLEJLP?=
 =?us-ascii?Q?zwF52wMPa4e/uVQX/704Tmp07rQiXHK78iVAIlDcXXh00in+JgWhe0Cvp1HU?=
 =?us-ascii?Q?7waFUcC3WxxrXlR1P8YcrVfSunwV2kH/j5he62lPBhjOjFnM7QufHGJDnNuU?=
 =?us-ascii?Q?sEAsGKkxJwKLOyj3bizwdYM5TGCwSZ0FNDjh8FlgmpxpVpMzwRl/kpdyhdAN?=
 =?us-ascii?Q?MlAs21gQr3PIPTIuHR2xEmro1paqsO09nlqHHd+k8yKRr+M02vaBmYMYjXqi?=
 =?us-ascii?Q?9nm5aomUYQJQv5YG2u3wtlz/HZwyp7KDGOi318g41NG46Tnr44LzDBU6k+fN?=
 =?us-ascii?Q?jZIQzJvMje99Yka6wK19UUehvrCo0P6Oc3rlFdHMVT0zXoghAKbqP21p02W5?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 953a43aa-9b6b-4b20-a895-08db26fe7266
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 15:44:08.8123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQ2dhs+O5xndLV5VhPF7Hd+m+FgqB1lhpiBLij30TAEMj/VUQBAlLd6oJrCaLxjxrwLyy81CmLY7Clvn+BVceYgVcCkH0B6bGjgfYkt14JE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7991
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/3] UML: define RUNTIME_DISCARD_EXIT
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
Cc: mauro.chehab@intel.com, thomas.hellstrom@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org,
 maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 04:07:40PM +0100, Mauro Carvalho Chehab wrote:
>On Thu, 16 Mar 2023 14:03:40 -0700
>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
>> From: Masahiro Yamada <masahiroy@kernel.org>
>>
>> With CONFIG_VIRTIO_UML=y, GNU ld < 2.36 fails to link UML vmlinux
>> (w/wo CONFIG_LD_SCRIPT_STATIC).
>>
>>   `.exit.text' referenced in section `.uml.exitcall.exit' of arch/um/drivers/virtio_uml.o: defined in discarded section `.exit.text' of arch/um/drivers/virtio_uml.o
>>   collect2: error: ld returned 1 exit status
>>
>> This fix is similar to the following commits:
>>
>> - 4b9880dbf3bd ("powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT")
>> - a494398bde27 ("s390: define RUNTIME_DISCARD_EXIT to fix link error
>>   with GNU ld < 2.36")
>> - c1c551bebf92 ("sh: define RUNTIME_DISCARD_EXIT")
>>
>> Fixes: 99cb0d917ffa ("arch: fix broken BuildID for arm64 and riscv")
>> Reported-by: SeongJae Park <sj@kernel.org>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>> Tested-by: SeongJae Park <sj@kernel.org>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> (cherry picked from commit b99ddbe8336ee680257c8ab479f75051eaa49dcf)
>
>Hacky... Ok, feel free to add my R-B:


yeah, but we still expect the branch to be rebased. git will
automatically drop this commit when we rebase to a point that already
has it.

>
>Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

thanks

Lucas De Marchi

>
>> ---
>>  arch/um/kernel/vmlinux.lds.S | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/um/kernel/vmlinux.lds.S b/arch/um/kernel/vmlinux.lds.S
>> index 16e49bfa2b42..53d719c04ba9 100644
>> --- a/arch/um/kernel/vmlinux.lds.S
>> +++ b/arch/um/kernel/vmlinux.lds.S
>> @@ -1,4 +1,4 @@
>> -
>> +#define RUNTIME_DISCARD_EXIT
>>  KERNEL_STACK_SIZE = 4096 * (1 << CONFIG_KERNEL_STACK_ORDER);
>>
>>  #ifdef CONFIG_LD_SCRIPT_STATIC
