Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1FBC36000
	for <intel-xe@archiver.kernel.org>; Fri, 21 Mar 2025 18:23:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA01B10E819;
	Fri, 21 Mar 2025 18:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJM0WqBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C974210E819
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Mar 2025 18:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742581433; x=1774117433;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EwbDTjPcLgyQoC1YvphGPqK8ejQO5u0K2koQERwjjCs=;
 b=MJM0WqBhw+BVaxQrUJbMSR8lGFcVCoS7vGQPh62XEGGKURfKE6A/TMAW
 kfHRyoO+MygvBOI1lzCmZY8OgFebFDiufKZMELbiDHlInsHg03T+Mu2yT
 8pB+O07B+2k8OLg6AUFVGvoKsf/L/aKdWGunCIY9iWV47GKf2B/IqwJlp
 +NfzfQo9Y0ADXk+SfxQeQ5pPLnCNA++caiQ3jNyxj9MlwOtuiaSxwBKP/
 tSwJGUszZRf5NJqqBy895tLt3zCV6tvrgdKQiA9bTpU7VE9q8XQnZ/g48
 y02XeWAFxPgW7KQsFlfOiuQnYpwlTYDGW5iFTAln4R55iU/8NUboY8sld w==;
X-CSE-ConnectionGUID: Rfod0xmwSzSCIS/OCid9iA==
X-CSE-MsgGUID: IcEO3cpnSeOROwpyKJlj/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54494562"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="54494562"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 11:23:49 -0700
X-CSE-ConnectionGUID: rAQT/63RQ6mJ7dspDXY1ng==
X-CSE-MsgGUID: 1f8gCKuZTw2E/i6IVHHDbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="123646058"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 11:23:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Mar 2025 11:23:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 11:23:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 11:23:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhTiQrIq6z+uIuZnzBnKIW98pXxiBSd2yT7tH4SN678fBErqDUuhrn6r8IP+Zo96A7J1nl6iI5T7ZAFlf5eOGryRejMAQhkN1tLZldDt3aqgkBNIQcqZkFefTKSmPIFNypLRfR0vquZpjhzdpVlyE7K4OeiX6LJtzYsC3tnQXw2+p3yC1F+cN9AalOZ+uZG0BXWIUAqrroM4jbvTzdGQ1ek5nU8L11JDprM6ihFBHhIUy5ibPEkfw+rVMC7xnE2GmnBLamoICMx0YS+X+HziMKs6eNSO07jb+2efToX6bBVRGqRw4hDdzCgzdqq3l3e26U0yprShM7blYfcKKQrD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVNXAyVqNuI+4kHNEV3elzFERHgtwGrejugs00GOIa4=;
 b=kJBRHuGkRXCu8+D1bhKm37UVBkUxN+VVvMycVKfS5dm2BVADwAO5Ibjro0LvTgJmu3i9qWE6GpHINf5iX3pcq9C66lpZODtYKJC9j6YWmxic8ajwKs59xPRi/sR0zm46WbAPJ8mm2R9JTQfmJvArozZP1rjNyF3Q5GzzodgkID+xDHuLHnOkphAAoF0VCcYp2kkXnffsBg91PiuUIJErgIlQrE7yOtqbLDg8CU7EftgkvJ0fo7uaaReoz8z8AgzAK7XaJicHYTuU6kOgSwegZU2ffaqZnTtXdIfRR9EeO4ui4khLjkMXmQ9Tv+gzkBhJ+WLW+HaPLUXVo9cTm8rSEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB7563.namprd11.prod.outlook.com (2603:10b6:510:286::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Fri, 21 Mar
 2025 18:23:28 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%7]) with mapi id 15.20.8534.036; Fri, 21 Mar 2025
 18:23:28 +0000
Date: Fri, 21 Mar 2025 13:23:25 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [CI 2/2] drm/xe/pm: Re-enable D3Cold by default on BMG
Message-ID: <ke7ywxzt4agbdnhvonfewvzpwserzy5if4kwf3fofjtn3yifim@fd2dkpxoihnv>
References: <20250308005636.1475420-1-rodrigo.vivi@intel.com>
 <20250308005636.1475420-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250308005636.1475420-2-rodrigo.vivi@intel.com>
X-ClientProxiedBy: MW4PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:303:8d::13) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB7563:EE_
X-MS-Office365-Filtering-Correlation-Id: a42ed832-11c0-45b9-1d46-08dd68a579da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DWTUFqeXKda0beVNVawf+UNb9r9aQO8mNl+dF72rz7n2KJuSWZZv9+s574TY?=
 =?us-ascii?Q?C1pQN1hp6rwugE9FZDE+3kvNK+Ti8Dez04OLfCB/UtUhxXQXxliqwAIbhyk1?=
 =?us-ascii?Q?D2ylSRmyTqHea7vcek7OtqNAaM1iE3e/VFUYM9rZUF88iaQ9U7KFBAY+lvY8?=
 =?us-ascii?Q?gTgpqHBZhr7s7WMSdKH3MAN4+fFjxuD7sRAP8CaGPfoZANK4DKv/oLpi2bs3?=
 =?us-ascii?Q?eGbFAehRkqhWWXNcY6SwO9diGiJFc8XbyGLXD9NqR07RIhOGgcZtmSC9tJVw?=
 =?us-ascii?Q?qFMPV+GHlw/En/8mL/3xpWy6FJd/n23ORqvx/H3hFM80nLHamyyEOA6MHKpJ?=
 =?us-ascii?Q?13hw7rtY8LUwIgWeRxxzdOVIX9ymWdXZaUI1gBq5E3IdZOihaVIIyEfx/Y0w?=
 =?us-ascii?Q?wJOwUo948I2q2/JDBZKSu/CNQaHMK2CXBWyhbKkaxdprlqORJCE7KwyRPy3Y?=
 =?us-ascii?Q?IOD+qO3nf9kbxCNylrM+eGcoGDSySRk2n9y5jfuXPDhwW+7ntdvTeRxd+w7d?=
 =?us-ascii?Q?kWHIk1sPSR8DTpwnzvsEC53OF2IqSDMROlEN+Xjz2+GJb9cxK9w/KGkKDrF1?=
 =?us-ascii?Q?Bb2VTDADw7xvREvJZdHfDIwx/XCNBSED8rb/UNZSYX+3Y0xsPIbj7J5Dh3I4?=
 =?us-ascii?Q?KBL84s/4HzXZnMP8S9N/fjKsEMZvL4W6gMDDW/RrAkaOs+6hKSEiA1yiaq9L?=
 =?us-ascii?Q?m2T5TI5jJ9qd5SIpETLTD2GxDescHlOW/Cj928paErRMx5Nn5a4QdRrCw5P8?=
 =?us-ascii?Q?Tkio856ePhvjVfWCPgdGFxWO1HRyMN17LHdzbsi4ZZge5lmg0jfBO1NXcgdb?=
 =?us-ascii?Q?/ClJrnQ63CT7Y9aVVqf5Ywcyy6zp+BIYwItpks6/mwqbPlfv6iw9EGIpTdnc?=
 =?us-ascii?Q?H1CqLpoBUBl04YoLwHpvVtzdqd5DdaPaQfPY4apWauxh05YQVyWAL2QtOnZL?=
 =?us-ascii?Q?zjyyvopRFhWGWsbTAYbjCjFSwH9F4ty9oPSBZ6AWX/bE0XdGnCh/YvEGOX2y?=
 =?us-ascii?Q?EDaS69xnbfmoowOkCc6G3lBgzeGCAKMVYG4bcwVk0XNgzZAHfgwQQ/v99HaU?=
 =?us-ascii?Q?fARcIl3rSFCCzgHtq4URqz+dHDRCyFvALeG6Y20SXacdo8QYygxmdOwWgazp?=
 =?us-ascii?Q?F4Ig96QfIuSjcN++FUDMaZrOjHt78woPtTL1O+zJpIHvTRNTeLfZSoNEBTBY?=
 =?us-ascii?Q?O5zVuCvvFWmy+j9b812O0ZrXuHYtMIpPjYET6rhHEQb3tP6cN4BW05c3b6ae?=
 =?us-ascii?Q?hNnbxyiFSrhGfNbODrn4MSmmyHBDM3UItlwn07aO0rKDUFl6EoVBhEqZUt2R?=
 =?us-ascii?Q?E7BMUU7SMbBgbbIBex566O/LoS604PWH7D5B2PiALwaLxg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PRQyr0wBBaYMNRM9oLiooNaD5fPVRPv5a0OFi2446vc5/mO8YBudkKFsntGp?=
 =?us-ascii?Q?7N9+oaesRHSvpXnewNN6yi4UDdh2FhZskxtfeDXsFWkr4f3Iaff8TWUOnjEF?=
 =?us-ascii?Q?eR8c8Ph8yDI2h9LQdIl0zjfIveTeHJ2rg9hBX+G9hvW/E+EBKsX8oal9evnu?=
 =?us-ascii?Q?xojYBPNN9TCkTP2226jIV9jY8x1UKJN3qtaAVQA0NB4QL72zvOV5kZii/c9b?=
 =?us-ascii?Q?1pMlF5BqA525uiHPSmyOisvd7ZgxqxDsryQTfACVcYNmKH3Nj3G/CTaQhlSH?=
 =?us-ascii?Q?lQ2B7/InFiveGnzsGKziJbXu9m3s/4kHRwHc2kpuQgSiL8M9pzTnjmktAZLf?=
 =?us-ascii?Q?gjAdEiIGKOkHqIpXw/c8v0wy/6IZTuv7Aj6H+AQt/Mtf+VvEKodBwNk1ZLIn?=
 =?us-ascii?Q?kNq8edBFL+lBH1DyfCt1He3A/YN+n/ca1TUB+C5ClMmarCooJ/diHaT45bhS?=
 =?us-ascii?Q?4A7wdZ677/wXqw4AtmaorAU2umne7+NnzAyO092FywR4+BzucQAV+wa0uNiZ?=
 =?us-ascii?Q?2EF3fOTTue91LKGEX5uBaOClPH4C0KJouZ3I5QduP5uHItRx+XKhkrDGyj1N?=
 =?us-ascii?Q?+G2mgnuMu0DsCJ6SRNmK/pfbvrwGb7vYoNt0imBOypQ0SYUmhsf/zKMMF/YU?=
 =?us-ascii?Q?MGcGqlJMbjKp0nOCwYlVowWTKKSmqFmsF709+2fCAz0DQfvnlg7M9vxRpqtA?=
 =?us-ascii?Q?UoYpn8pGXrQLLXI3MQUSNd240MWecBT+r0U5J6P9eIFq42W3YysikVmDYX0U?=
 =?us-ascii?Q?IfoAkdwdq5kXP7wFq9yFS9/d8vLUtQdbf3JM3/cNCxXGD4j43w2/cSpnIUtv?=
 =?us-ascii?Q?4xPIz3xeC2UxZVy5rl1XJGTHDo+BFgQa21EG35vzHx2ElVKFuaMooqNqqifW?=
 =?us-ascii?Q?m+e6NOhYC/aNTulueFS0tQk8TuT+7ZpQF5vROcl00Jx8xl31/D5+eM+WqBhH?=
 =?us-ascii?Q?WU8vp+aXdc0TVJbY6pPl0IwIzryQNfuJ0ivQhp9+/nRkTGV3F2t4oIgJEt6b?=
 =?us-ascii?Q?n5KRkafpdQjTcA5bwqY9Ulg56rvZTui32wu+3Vf9fUv5fGG+xCVwji11Rakp?=
 =?us-ascii?Q?eliop7UBpinFr6lbYBC0f9PVO/wwPunHHJO7UDmWqNwvPKeP4iH9JaYSY7qh?=
 =?us-ascii?Q?p293/pOW/p+xCLh43PSx6EKapQGobeN3KMFJBPp1pxJGNzY1wsP/KNOrYGrA?=
 =?us-ascii?Q?X7Yd50D79pA2uvcHPyPT89Es1nipTFSeigesShMor1yiJbfrkQmvkW6lhZCQ?=
 =?us-ascii?Q?soOlgzlmYlUIP6P+UKP5xFoEokF13d6I57v8tUTCiTwgYozUKEaaruE+drNr?=
 =?us-ascii?Q?dTg3IXU+HMRVYaEADhZhHtOQwbD0FrpwZPCoreP37JBwzGShlTtJ2cJGcpow?=
 =?us-ascii?Q?LUAAiXDCyEDkuK/q1yxoXoNaVFKOQrPPm47J2CfkG0wyNESg92Jsk6aK+Ilr?=
 =?us-ascii?Q?y+lFWtLn/F2DDWCO/yF4ckJV4zQDUIXBjgiPgswYhxO7vTTIsfsKaJRP7TpD?=
 =?us-ascii?Q?bnSynf6KV8LyXjZQfrCglHxtmY2MojLwVkAhCK5LowaP2hKap5FJQoXUIxrl?=
 =?us-ascii?Q?DxPwFi1wKYQU/jI5qY1fOxBnEFbTIaOMH/XAfyFUcaaR2Fo0L2D+PjPBWFLp?=
 =?us-ascii?Q?BA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a42ed832-11c0-45b9-1d46-08dd68a579da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 18:23:28.1814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AAx8XCnO5TItu8M1eWc686lM0Mt540kR4S1HRyTSnJ0zSLKUStCNXpytsKtMwJrU3ZgikReN2/EjZP2pisIOtT6mrYR5fG0NDawHm/mOWPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7563
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

On Fri, Mar 07, 2025 at 07:56:36PM -0500, Rodrigo Vivi wrote:
>This patch re-enables D3Cold by default on BMG.
>
>If issues on runtime_pm resume are seen and the D3cold->D0 transition
>is suspected to block the device or cause memory corruptions, D3cold
>can be disabled for confirmation with either:
>
>1. at runtime:
>   echo 0 > /sys/bus/pci/devices/<addr>/vram_d3cold_threshold
>
>2. at boot:
>   pcie_port_pm=off
>
>Upon confirmation of D3Cold related bug, please file a bug to the
>link below.
>
>Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

weren't you supposed to apply this patch to topic/xe-for-CI? I was
rebasing that branch to be able to tweak the firmware definitions[1] and
noticed there's only the first patch in that branch, but not this one.
Did you forget to push?

$ cat src/integration-manifest  | grep xe-for-CI
drm-xe topic/xe-for-CI 4868f2aad04f639490d35b90e1f9f73919078ffd

$ git log --oneline drm-xe/drm-xe-next..4868f2aad04f639490d35b90e1f9f73919078ffd
4868f2aad04f6 (drm-xe/topic/xe-for-CI) drm/xe/pm: Temporarily disable D3Cold on BMG
6ea369b34748e drm/xe/ptl: Define HuC FW version for PTL
9a67bf39ece1c drm/xe/ptl: Add GuC firmware definition
413e37a14b3b5 drm/xe/pvc: Add GuC firmware definition
57fbbc317bba7 drm/xe: Add PVC's PCI device IDs
d8cfdbde9e7bf drm/xe: Enable SR-IOV for ADL/ATSM

Lucas De Marchi

[1] https://lore.kernel.org/intel-xe/20250307-xe-per-gt-fw-v1-0-459574d76400@intel.com/
